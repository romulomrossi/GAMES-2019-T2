package multiplayer.gameEvents;

class PlayerIngressedEvent extends GameEvent
{
    public var x:Float;
    public var y:Float;

    public var nickname:String;

    public function new(nickname:String) 
    {
        opCode = GameEventTypes.PlayerIngressed;

        x = 50;
        y = 50;

        this.nickname = nickname;
    }    
}