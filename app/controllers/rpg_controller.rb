class RpgController < ApplicationController
  def index

    if !session[:gold] 
      session[:gold] = 0
    end

    # session[:gold] = 0 if !session[:gold]

     if !session[:message] 
      session[:message] = ''
    end

    @gold = session[:gold]

    if !session[:totalGold] 
     session[:totalGold] = 0    
    else
      session[:totalGold] += @gold
    end

    @totalGold = session[:totalGold]
    @location = session[:location]

    if @gold > 0
      session[:message] += "<p class='green'>You earned " + @gold.to_s + " gold from the " + @location + "! (" + Time.now.strftime("%I:%M:%p,%m/%d/%Y") + ")</p>"
    elsif @gold < 0
      session[:message] += "<p class='red'>You lost " + @gold.to_s + "gold from the " + @location + "! (" + Time.now.strftime("%I:%M:%p,%m/%d/%Y") + ")</p>"
    end

    @message = session[:message]
   
  end

  def farm
    session[:gold] = rand(10..20)
    session[:location] = 'farm'
    redirect_to('/')
  end

  def casino
    session[:gold] = rand(-50..50)
    session[:location] = 'casino'

    redirect_to('/')
  end

  def cave

    session[:gold] = rand(5..10)
    session[:location] = 'cave'

    redirect_to('/')

  end

  def house
    session[:gold] = rand(2..5)
    session[:location] = 'house'

    redirect_to('/')
  end

  def reset
    reset_session
    redirect_to('/')
  end
end
