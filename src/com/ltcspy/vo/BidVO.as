package com.ltcspy.vo
{
	public class BidVO extends MarketOrderVO
	{
		
		public function BidVO(qty:Number, cost:Number)
		{
			super();
			quantity = qty;
			price = cost;
		}
	}
}