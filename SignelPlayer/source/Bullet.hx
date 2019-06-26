package;

import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Bullet extends FlxSprite
{
    public function new(enemies:FlxTypedGroup<Meteor>) 
    {
        super();
        kill();
        makeGraphic(5, 5, FlxColor.RED);
    }

    override public function update(e:Float)
    {   
        if(!isOnScreen())
            kill();

        super.update(e);    
    }

    public function shot(triggerPoint:FlxPoint, direction:Int) 
    {
        this.reset(triggerPoint.x + 16, triggerPoint.y + 16);

        var velocity = 500;

        switch(direction)
        {
            case FlxObject.UP:
                this.velocity.y = - velocity;
            case FlxObject.DOWN:
                this.velocity.y = velocity;
            case FlxObject.RIGHT:
                this.velocity.x = velocity;
            case FlxObject.LEFT:
                this.velocity.x = -velocity;                
            default:
                FlxG.log.add("Invalid direction received");
        }
    }
}