class FramesIndex < Chewy::Index
	define_type Frame do
		field :artist, :email, :title, :category, :tags, :aws_url, :sold_times, :income
	end
end