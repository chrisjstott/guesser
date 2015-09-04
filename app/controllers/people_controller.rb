class PeopleController < ApplicationController
  def new
    @person = Person.new
    render :new
  end
  
  def create
    @person = Person.new(person_params)
    
    if @person.save
      render :new
    else
      flash.now[:errors] = @person.errors.full_messages
      render :new
    end
  end
  
  def index
    person = Person.new(person_params)
    
    height = person.height
    weight = person.weight
    
    people_at_height = Person.where(height: (height.to_i - 1)..(height.to_i + 1))
    if people_at_height.count > 0
      percent_male_at_height = people_at_height.where(gender: 'M').count/people_at_height.count
    else
      percent_male_at_height = 0.5
    end
      
    people_at_weight = Person.where(weight: (weight.to_i - 3)..(weight.to_i + 3))
    if people_at_weight.count > 0
      percent_male_at_weight = people_at_weight.where(gender: 'M').count/people_at_weight.count
    else
      percent_male_at_weight = 0.5
    end

    render json: '{"percentMaleAtHeight": "#{percent_male_at_height}", "percentMaleAtWeight": "#{percent_male_at_weight}"}'
  end
  
private
  def person_params
    params.require(:person).permit(:height, :weight, :gender)
  end
end
