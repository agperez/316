class Medium::Radio < Medium

  def title
    "Episode 0#{episode_number}"
  end

  def self.ordered(params)
    where(published: [true, nil]).reorder("s_date DESC").paginate(page: params[:page])
  end



end
