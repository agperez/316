class Medium::Radio < Medium


  def self.ordered(params)
    where(published: [true, nil]).reorder("s_date DESC").paginate(page: params[:page])
  end



end
