package display.tetrominos  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Tetromino extends FlxSprite 
	{								
		
		private var _type:TetrominoType;
				
		public function get type():TetrominoType
		{
			return _type;
		}
				
		public function Tetromino(type:TetrominoType, X:Number=0, Y:Number=0, color:uint = 0xffffffff) 
		{
			super(X, Y);
			
			this._type = type;		
			this.color = (color & 0x00ffffff);
			this.alpha = ((Number)((color >> 24) & 0x000000ff)) / 255.0;
			this.generateGraphic();
		}		
		
		public function generateGraphic():void
		{			
			var alphaValue:uint = ((((uint)(this.alpha * 255.0)) << 24) && 0xff000000);
			var fillColor:uint = this.color | alphaValue;
			var canvas:BitmapData;
			if (_type == TetrominoType.I)
			{
				this.makeGraphic(4, 1, 0x00000000);
				canvas = new BitmapData(4, 1, true, 0x0);
				canvas.fillRect(new Rectangle(0, 0, 4, 1), fillColor);
			}
			else if (_type == TetrominoType.O)
			{
				this.makeGraphic(2, 2, 0x00000000);
				canvas = new BitmapData(2, 2, true, 0x0);
				canvas.fillRect(new Rectangle(0, 0, 2, 2), fillColor);
			}
			else if (_type == TetrominoType.T)
			{
				this.makeGraphic(3, 2, 0x00000000);
				canvas = new BitmapData(3, 2, true, 0x0);
				canvas.fillRect(new Rectangle(0, 0, 3, 1), fillColor);
				canvas.setPixel32(1, 1, fillColor);
			}
			else if (_type == TetrominoType.S)
			{
				this.makeGraphic(3, 2, 0x00000000);
				canvas = new BitmapData(3, 2, true, 0x0);
				canvas.fillRect(new Rectangle(1, 0, 2, 1), fillColor);
				canvas.fillRect(new Rectangle(0, 1, 2, 1), fillColor);
			}
			else if (_type == TetrominoType.Z)
			{
				this.makeGraphic(3, 2, 0x00000000);
				canvas = new BitmapData(3, 2, true, 0x0);
				canvas.fillRect(new Rectangle(0, 0, 2, 1), fillColor);
				canvas.fillRect(new Rectangle(1, 1, 2, 1), fillColor);
			}
			else if (_type == TetrominoType.L)
			{
				this.makeGraphic(3, 2, 0x00000000);
				canvas = new BitmapData(3, 2, true, 0x0);
				canvas.fillRect(new Rectangle(0, 0, 3, 1), fillColor);
				canvas.setPixel32(0, 1, fillColor);
			}
			else if (_type == TetrominoType.J)
			{
				this.makeGraphic(3, 2, 0x00000000);
				canvas = new BitmapData(3, 2, true, 0x0);
				canvas.fillRect(new Rectangle(0, 0, 3, 1), fillColor);
				canvas.setPixel32(2, 1, fillColor);
			}
			this.pixels = canvas;
			this.dirty = true;
			this.update();
		}
		
	}

}