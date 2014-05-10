package data 
{
	import utils.Enumerable;
	import utils.Utils;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class ScaleKey extends Enumerable
	{
				
		public var optionIndex:uint;
		
		public function ScaleKey(OptionIndex:int)
		{
			this.optionIndex = OptionIndex;
		}
		
		public static const C		:ScaleKey = new ScaleKey(0);
		public static const Db		:ScaleKey = new ScaleKey(1);
		public static const D		:ScaleKey = new ScaleKey(2);
		public static const Eb		:ScaleKey = new ScaleKey(3);
		public static const E		:ScaleKey = new ScaleKey(4);
		public static const F		:ScaleKey = new ScaleKey(5);
		public static const Gb		:ScaleKey = new ScaleKey(6);
		public static const G		:ScaleKey = new ScaleKey(7);
		public static const Ab		:ScaleKey = new ScaleKey(8);
		public static const A		:ScaleKey = new ScaleKey(9);
		public static const Bb		:ScaleKey = new ScaleKey(10);
		public static const B		:ScaleKey = new ScaleKey(11);
		
		public static const CSharp	:ScaleKey = Db;
		public static const DSharp	:ScaleKey = Eb;
		public static const FSharp	:ScaleKey = Gb;
		public static const GSharp	:ScaleKey = Ab;
		public static const ASharp	:ScaleKey = Bb;

		{
			CSharp.description = "C#";
			DSharp.description = "D#";
			FSharp.description = "F#";
			GSharp.description = "G#";
			ASharp.description = "A#";
			Utils.InitEnumConstants(ScaleKey);
		}		
		
		public static function getOptions():Vector.<ScaleKey>
		{
			var result:Vector.<ScaleKey> = new Vector.<ScaleKey>();
			result.push(C, CSharp, D, DSharp, E, F, FSharp, G, GSharp, A, ASharp, B);
			return result;
		}
		
	}

}