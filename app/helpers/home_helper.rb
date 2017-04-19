module HomeHelper

	# フラッシュを調べる
	def flash(suit_array)
		s_count = 0
		h_count = 0
		d_count = 0
		c_count = 0
		suit_array.each do |suit|
			case suit
			when "S"
				s_count += 1
			when "H"
				h_count += 1
			when "D"
				d_count += 1
			when "C"
				c_count += 1
			else
				break
			end
		end
		if s_count == 5 || h_count == 5 || d_count == 5 || c_count == 5
		  return true
		end
		return false
	end

	# ストレートを調べる
	def straight(num_array)
		if num_array == [13,12,11,10,1] || num_array == [13,12,11,2,1] || num_array == [13,12,3,2,1] || num_array == [13,4,3,2,1]
		  return true
		end

		i = 0
		while i < (num_array.size - 1)
			if num_array[i] - num_array[i + 1] == 1
				i += 1
			else
				return false
			end
		end
		return true
	end

	# フォー・オブ・ア・カインドを調べる
	def four_of_a_kind(num_array)
		x = 0
		i = 0
		while i < (num_array.size)
			if num_array[2] == num_array[i]
				x += 1
			end
			i += 1
		end

		if x == 4
			return true
		end
		return false
	end

	# スリー・オブ・ア・カインドを調べる
	def three_of_a_kind(num_array)
		x = 0
		i = 0
		while i < (num_array.size)
			if num_array[2] == num_array[i]
				x += 1
			end
			i += 1
		end

		if x == 3
			return true
		end
		return false
	end

	# フルハウスを調べる(スリーカードとセットの時のみ)
	def full_house(num_array)
		x = 0
		i = 0
		while i < num_array.size
			if num_array[i] == num_array[i + 1]
				x += 1
			end
			i += 1
		end

		if x == 3
			return true
		end
		return false
	end


	# ツーペアを調べる
	def two_pair(num_array)
		x = 0
		i = 0
		while i < (num_array.size - 1)
			if num_array[i] == num_array[i + 1]
				x += 1
				i += 2
			else
			  i += 1
			end
		end

		if x == 2
			return true
		end
		return false
	end

	# ワンペアを調べる
	def one_pair(num_array)
		x = 0
		i = 0
		while i < (num_array.size - 1)
			if num_array[i] == num_array[i + 1]
				x += 1
			end
			i += 1
		end

		if x == 1
			return true
		end
		return false
	end

end
