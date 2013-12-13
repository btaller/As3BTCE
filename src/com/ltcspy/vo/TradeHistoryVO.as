package com.ltcspy.vo
{
	public class TradeHistoryVO
	{
		//{"date":1386972440,"price":29.74,"amount":23.1096,"tid":20517410,"price_currency":"USD","item":"LTC","trade_type":"ask"},
		public var date:Number;
		public var price:Number;
		public var amount:Number;
		public var tid:Number;
		public var price_currency:String;
		public var item:String;
		public var trade_type:String;
		public function TradeHistoryVO(seedData:Object)
		{
			if(seedData) seed(seedData);
		}
		
		private function seed(seedData:Object):void
		{
			date = seedData.date;
			price = seedData.price;
			amount = seedData.amount;
			tid = seedData.tid;
			price_currency = seedData.price_currency;
			item = seedData.item;
			trade_type = seedData.trade_type;
		}
	}
}