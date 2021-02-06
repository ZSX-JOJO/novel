<?php


namespace app\mobile\controller;


use app\BaseController;
use app\model\FriendshipLink;
use think\facade\Env;
use think\facade\View;

class Base extends BaseController
{
    protected $uid;
    protected $prefix;
    protected $redis_prefix;
    protected $end_point;
    protected $server;
    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->uid = cookie('xwx_user_id');
        $this->prefix = Env::get('database.prefix');
        $this->redis_prefix = Env::get('cache.prefix');
        $this->end_point = config('seo.book_end_point');
        $this->server = config('site.server');
        $tpl_root = './template/'.config('site.tpl').'/m/';
        $controller = strtolower($this->request->controller());
        $action = strtolower($this->request->action());
        $this->tpl = $tpl_root.$controller.'/'.$action.'.html';

        $links = cache('friendshipLink');
        if ($links == false){
            $links = FriendshipLink::select();
            cache('friendshipLink',$links,null,'redis');
        }
        View::assign([
            'links' => $links,
            'url' => config('site.domain'),
            'site_name' => config('site.site_name'),
            'mobile_url' => config('site.mobile_domain'),
            'book_ctrl' => BOOKCTRL,
            'chapter_ctrl' => CHAPTERCTRL,
            'booklist_act' => BOOKLISTACT,
            'search_ctrl' => SEARCHCTRL,
            'rank_ctrl' => RANKCTRL,
            'update_act' => UPDATEACT,
            'author_ctrl' => AUTHORCTRL,
            'tag_ctrl' => TAGCTRL,
            'end_point' => config('seo.book_end_point'),
            'xwx_user_id' => $this->uid,
            'xwx_user' => cookie('xwx_user'),
            'xwx_nick_name' => cookie('xwx_nick_name'),
            'server' => config('site.server'),
        ]);
    }
}