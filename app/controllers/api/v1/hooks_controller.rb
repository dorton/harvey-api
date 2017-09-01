class Api::V1::HooksController < ApiController

  def sheet_update
    ImportNeedsJob.perform_later
    ImportSheltersJob.perform_later
    head :ok
  end

end
