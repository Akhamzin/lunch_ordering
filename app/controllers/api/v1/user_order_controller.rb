class Api::V1::UserOrderController < Api::V1::BaseController
#http_basic_authenticate_with name: &amp;quot;admin&amp;quot;, password: &amp;quot;secret&amp;quot;
      

	def index
		orders = UserOrder.where(date: Date.today)
		#orders = apply_filters(orders, params)
		render(
			json: ActiveModel::ArraySerializer.new(
				orders,
				each_serializer: Api::V1::UserOrderSerializer,
				root: 'orders',
				)
			)
	end
end
