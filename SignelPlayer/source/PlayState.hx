package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxCollision;
import flixel.text.FlxText;
import haxe.CallStack.StackItem;
import flixel.math.FlxPoint;
import flixel.input.keyboard.FlxKey;
import flixel.addons.plugin.taskManager.FlxTask;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
    var _player:Player;
    var _bullets:FlxTypedGroup<Bullet>;
    var _enemies:FlxTypedGroup<Meteor>;
    var _hud:FlxText;
    var _score:Int = 0;

    var _respawnTimer:Float = 0;

    override public function create():Void
    {
        _player = new Player();
        _bullets = new FlxTypedGroup<Bullet>();
        _enemies = new FlxTypedGroup<Meteor>();
        _hud = new FlxText(15, 15, 0, "Score: " + _score);

        var background = new FlxSprite();
        background.loadGraphic(AssetPaths.background__jpg);   
        add(background);

        for(i in 0...100)
        {
            _enemies.add(new Meteor(_player));
            _bullets.add(new Bullet(_enemies));
        }

        add(_hud);
        add(_player);
        add(_bullets);
        add(_enemies);

        super.create();
    }

    override public function update(e:Float)
    {
        _hud.text = "Score: " + _score;

        if(_player.alive == false)
            FlxG.switchState(new GameOverState(_score));

        _respawnTimer += e;

        if(_respawnTimer > 0.65)
        {
            var enemy:Meteor = _enemies.getFirstAvailable();
            if(enemy != null)
            {
                enemy.respawn();
            }

            _respawnTimer = 0;
        }
        
        verifyBulletsCollision();
        handleKeyBoard();
        super.update(e);
    }

    private function verifyBulletsCollision() 
    {
        for(bullet in _bullets)
        {
            if(!bullet.alive)
                continue;

            for(enemy in _enemies)
            {
                if(enemy != null)
                {
                    if(!enemy.alive)
                        continue;

                    if(FlxCollision.pixelPerfectCheck(bullet, enemy))
                    {
                        enemy.hurt(10);
                        bullet.kill();

                        _score += 10;
                        FlxG.log.add(_score);
                    }
                    
                }
            }
        }
    }

    private function handleKeyBoard() 
    {
        if(FlxG.keys.anyJustReleased([FlxKey.DOWN, FlxKey.UP, FlxKey.LEFT, FlxKey.RIGHT]))
            _player.stopMoving();

        if(FlxG.keys.anyPressed([FlxKey.DOWN]))
            _player.startMoving(FlxObject.DOWN);

        if(FlxG.keys.anyPressed([FlxKey.UP]))
            _player.startMoving(FlxObject.UP);

        if(FlxG.keys.anyPressed([FlxKey.RIGHT]))
            _player.startMoving(FlxObject.RIGHT);

        if(FlxG.keys.anyPressed([FlxKey.LEFT]))
            _player.startMoving(FlxObject.LEFT); 

        if(FlxG.keys.justPressed.SPACE)
            shot(_player.getPosition(), _player.facing);        
    }

    private function shot(point:FlxPoint, direction:Int) 
    {
        var b:Bullet = _bullets.getFirstAvailable();

        if(b != null)
            b.shot(point, direction);    
    }

}