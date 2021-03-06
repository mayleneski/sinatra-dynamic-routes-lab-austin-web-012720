require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end
  
  get '/square/:number' do
    @square = params[:number].to_i ** 2
    "#{@square}"
  end

  get '/say/:number/:phrase' do
    n = params[:number].to_i
    phrase = ''
    n.times do 
      phrase += params[:phrase]
    end
    phrase
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get '/:operation/:number1/:number2' do
    answer = ''
    if params[:operation] == "add"
      answer = params[:number1].to_i + params[:number2].to_i
    elsif params[:operation] == "subtract"
      answer = params[:number1].to_i - params[:number2].to_i
    elsif params[:operation] == "multiply"
      answer = params[:number1].to_i * params[:number2].to_i
    else
      answer = params[:number1].to_i / params[:number2].to_i
    end
    "#{answer}"
    
    #Solution: this looks like a great way to refactor as well
    # number1 = params[:number1].to_i
    # number2 = params[:number2].to_i

    # answer = 'Unable to perform this operation'

    # case params[:operation]
    # when 'add'
    #   answer = (number1 + number2).to_s
    # when 'subtract'
    #   answer = (number1 - number2).to_s
    # when 'multiply'
    #   answer = (number1 * number2).to_s
    # when 'divide'
    #   answer = (number1 / number2).to_s
    # end
  end
end