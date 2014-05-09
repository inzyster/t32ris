package data 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Registry 
	{

		public static var BPM:uint;
		public static var scale:Scale;
		
		public static function initialize():void
		{
			BPM = 120;
			scale = new Scale(ScaleKey.C, ScaleType.Major);
		}
		
		public static function erase():void
		{
			BPM = 0;
			scale = null;
		}
		
	}

}