class NestedFormsController < ApplicationController
  
  before_action :setup_project

  def destroy
  end
   def new
  end

  def setup_project
    @post=Post.new(nested_forms: [NestedForm.new])
  end

end
