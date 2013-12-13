package com.ltcspy.vo
{
	public class TickerVO
	{
		//{"ticker":{"high":908.96002,"low":841.20398,"avg":875.082,"vol":13981035.37207,"vol_cur":16028.64252,"last":847.2,"buy":855,"sell":849,"updated":1386962805,"server_time":1386962806}}
		public var high:Number = 0;
		public var low:Number = 0;
		public var avg:Number = 0;
		public var vol:Number = 0;
		public var vol_cur:Number = 0;
		public var last:Number = 0;
		public var buy:Number = 0;
		public var sell:Number = 0;
		public var updated:Number = 0;
		public var server_time:Number = 0;
		public function TickerVO(seed:Object=null)
		{
			if(seed) seedData(seed);
		}
		
		private function seedData(seed:Object):void
		{
			high = seed.high;
			low = seed.low;
			avg = seed.avg;
			vol = seed.vol;
			vol_cur = seed.vol_cur;
			last = seed.last;
			buy = seed.buy;
			sell = seed.sell;
			updated = seed.updated;
			server_time = seed.server_time;
		}		
		
	}
}