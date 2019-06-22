package multiplayer.gameEvents;

import flixel.group.FlxGroup.FlxTypedGroup;

class GameSyncEvent extends GameEvent
{
    public var players:FlxTypedGroup<Player>;

    public function new(players:FlxTypedGroup<Player>) 
    {
        this.players = players;
        this.opCode = GameEventTypes.GameSync;
    }
}