package;

import flixel.group.FlxGroup.FlxTypedGroup;
import haxe.macro.Expr.Catch;
import multiplayer.Client;
import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
    var _players:FlxTypedGroup<Player>;
    var _mpClient:Client;

    var _localPlayerNickname:String;

    public function new(nickname:String, localIp:String, localPort:Int)
    {
        _players = new FlxTypedGroup<Player>();
        _localPlayerNickname = nickname;
        
        try
        {
            _mpClient = Client.getInstance();
            _mpClient.sendIngressRequest(nickname, localIp, localPort);
        }
        catch(s:String)
        {
            FlxG.log.add(s);
        }

        super();
    }

    override public function create():Void
    {
        add(_players);

        super.create();
    }

    override public function update(e:Float)
    {


        super.update(e);
    }

    public function addPlayer(nickname:String, x:Float, y:Float)
    {
        var isLocal = _localPlayerNickname == nickname;
        _players.add(new Player(isLocal));
    }
}