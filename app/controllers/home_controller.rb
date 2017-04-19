class HomeController < ApplicationController

	def new
	end

	def create
		@cards = params[:cards]
		cards = @cards.split(" ")

		if params[:cards].blank? || cards.size != 5
			redirect_to root_path, notice: "正しい値を入力してください。"
		end

		# 数字のみのnum_arrayを作成する
		num_array = cards.map { |card| card.delete("C-S") }
		num_array = num_array.map { |num| num.to_i }
		# num_arrayを数字の大きい順に並べる
		num_array.sort! { |a, b| b <=> a }

		# スートのみのsuit_arrayを作成する
		suit_array = cards.map { |card| card.delete("0-9") }

		if flash(suit_array)
			if straight(num_array)
				@hand = "ストレートフラッシュ"
			else
				@hand = "フラッシュ"
			end
		elsif straight(num_array)
			@hand = "ストレート"
		elsif four_of_a_kind(num_array)
			@hand = "フォー・オブ・ア・カインド"
		elsif three_of_a_kind(num_array)
			if full_house(num_array)
				@hand = "フルハウス"
			else
			  @hand = "スリー・オブ・ア・カインド"
			end
		elsif two_pair(num_array)
			@hand = "ツーペア"
		elsif one_pair(num_array)
			@hand = "ワンペア"
		else
			@hand = "ハイカード"
		end
	end

end
