package multiplayer.gameEvents;

import flixel.group.FlxGroup.FlxTypedGroup;

class GameSyncEvent extends GameEvent
{
    public var player:Player;

    public function new(player:Player) 
    {
        this.player = player;
        this.opCode = GameEventTypes.GameSync;
    }
}