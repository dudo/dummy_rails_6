class ThingsController < ApplicationController
  include ActionController::MimeResponds

  def index
    respond_to do |format|
      format.pb do
        render plain: ThingList.new(things: resource_scope.all.map { |r| ThingResponse.new(r.as_json) }).to_proto
      end
      format.all { super }
    end
  end
end
