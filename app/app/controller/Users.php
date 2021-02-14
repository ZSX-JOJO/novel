<?php


namespace app\app\controller;


use app\common\RedisHelper;
use app\model\ArticleArticle;
use app\model\Comments;
use app\model\SystemUsers;
use app\model\User;
use app\model\UserFavor;
use app\model\UserFinance;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;

class Users extends BaseAuth
{
    protected $userService;

    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->userService = app('userService');
    }

    public function bookshelf()
    {
        $favors = UserFavor::where('uid', '=', $this->uid)->select();
        foreach ($favors as &$favor) {
            $book = ArticleArticle::find($favor->book_id);
            $bigId = floor((double)($book['articleid'] / 1000));
            $book['cover'] = $this->server . sprintf('/files/article/image/%s/%s/%ss.jpg',
                $bigId, $book['articleid'], $book['articleid']);
            $favor['book'] = $book;
        }
        $result = [
            'success' => 1,
            'favors' => $favors
        ];
        return json($result);
    }

    public function delfavors()
    {
        $ids = explode(',', input('ids')); //书籍id;
        $this->userService->delFavors($this->uid, $ids);
        return json(['success' => 1, 'msg' => '删除收藏']);
    }

    public function switchfavor()
    {
        $redis = RedisHelper::GetInstance();
        if ($redis->exists('favor_lock:' . $this->uid)) { //如果存在锁
            return json(['success' => 0, 'msg' => '操作太频繁']);
        } else {
            $redis->set('favor_lock:' . $this->uid, 1, 3); //写入锁

            $articleid= input('articleid');
            $where[] = ['articleid', '=', $articleid];
            $where[] = ['uid', '=', $this->uid];
            try {
                $userFaver = UserFavor::where($where)->findOrFail();
                $userFaver->delete(); //如果已收藏，则删除收藏
                return json(['success' => 1, 'isfavor' => 0]); //isfavor为0表示未收藏
            } catch (ModelNotFoundException $e) {
                $userFaver = new UserFavor();
                $userFaver->articleid = $articleid;
                $userFaver->uid = $this->uid;
                $userFaver->save();
                return json(['success' => 1, 'isfavor' => 1]); //isfavor表示已收藏
            }
        }
    }

    public function update()
    {
        $nick_name = input('nickname');
        $password = input('password');
        try {
            $user = SystemUsers::findOrFail($this->uid);
            $user->name = $nick_name;
            if (empty($password) || is_null($password)) {

            } else {
                $user->pass = md5($password.$user->salt);
            }
            $res = $user->save(['id' => $this->uid]);
            if ($res) {
                session('xwx_nick_name', $nick_name);
                return json(['success' => 1, 'msg' => '修改成功', 'userInfo' => $user]);
            } else {
                return json(['success' => 0, 'msg' => '修改失败']);
            }
        } catch (DataNotFoundException $e){
            return json(['success' => 0, 'msg' => '修改失败']);
        }
    }

    public function isfavor()
    {
        $articleid = input('articleid');
        $isfavor = 0;
        $where[] = ['uid', '=', $this->uid];
        $where[] = ['articleid', '=', $articleid];
        try {
            $userfavor = UserFavor::where($where)->findOrFail();
            $isfavor = 1;
        } catch (ModelNotFoundException $e) {
            $isfavor = 0;
        }

        $result = [
            'success' => 1,
            'isfavor' => $isfavor
        ];
        return json($result);
    }
}