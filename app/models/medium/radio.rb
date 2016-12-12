class Medium::Radio < Medium


  def title
    "Episode #{episode_number}"
  end

  def self.ordered(params)
    where(published: [true, nil]).reorder("s_date DESC").paginate(page: params[:page])
  end

  def should_generate_new_friendly_id?
    episode_number_changed?
  end




end
