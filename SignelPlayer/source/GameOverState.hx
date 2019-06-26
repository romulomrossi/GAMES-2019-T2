package;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxState;

class GameOverState extends FlxState
{
    var _score:Int;

    public function new(score:Int) 
    {
        super();

        _score = score;
    }

    private function onPlay()
    {
        FlxG.switchState(new PlayState());
    }

    override public function create() 
    {
        var background = new FlxSprite();
        background.loadGraphic(AssetPaths.background__jpg);   
        add(background);

        var centerX = FlxG.width / 2;
        var centerY = FlxG.height / 2;

        var gameOverText = new FlxText();
        gameOverText.size = 14;
        gameOverText.text = "Game Over!";
        gameOverText.x = centerX - gameOverText.width / 2;
        gameOverText.y = centerY - 30;
        
        var scoreText = new FlxText();
        scoreText.size = 12;
        scoreText.text = "Your score was " + _score;
        scoreText.x = centerX - scoreText.width / 2;
        scoreText.y = centerY;

        var startButton = new FlxButton(centerX - 40, centerY + 60, "Play Again", onPlay);
        
        add(startButton);
        add(scoreText);
        add(gameOverText);
        
        super.create();
    }
}