package com.ltcspy.vo
{
	public class AskVO extends MarketOrderVO
	{
		public function AskVO(qty:Number, cost:Number)
		{
			super();
			quantity = qty;
			price = cost;
		}
	}
}