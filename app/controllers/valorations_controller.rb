require 'pry'
require 'json'

class ValorationsController < ApplicationController
  before_action :set_valoration, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @valorations = Valoration.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @valoration = Valoration.find(params[:id])
  end

  # GET /tweets/new
  def new

    @tweets = Tweet.all

    @tweets.each do |tweet|

      if(tweet.lang == "en" && !tweet.valorado)

        response = Unirest.post "http://text-processing.com/api/sentiment/", 
                            headers:{ "Accept" => "application/json" }, 
                            parameters:{ :text => tweet.text }


        label = response.body["label"]
        
        if label == "pos"
          label_valor = response.body["probability"]["pos"]
          #if label_valor > 0.7
            @newTweet = Tweet.new({ source: tweet.source, text: tweet.text, created_at: tweet.created_at, favorite_count: tweet.favorite_count, lang: tweet.lang, etiqueta: label, porcentaje: label_valor, valorado:true })
            @newTweet.save
        #  end
        elsif label == "neg"
          label_valor = response.body["probability"]["neg"]
         # if label_valor > 0.7
            @newTweet = Tweet.new({ source: tweet.source, text: tweet.text, created_at: tweet.created_at, favorite_count: tweet.favorite_count, lang: tweet.lang, etiqueta: label, porcentaje: label_valor, valorado:true })
            @newTweet.save
          #end 
        else
          @newTweet = Tweet.new({ source: tweet.source, text: tweet.text, created_at: tweet.created_at, favorite_count: tweet.favorite_count, lang: tweet.lang, etiqueta: label, porcentaje: label_valor, valorado:true })
          @newTweet.save
        end

        infoCiudad = Valoration.where(ciudad_v: tweet.source).first()

        plusFollowes = 0

        if(tweet.favorite_count > 1000000)
          plusFollowes = 1
        elsif(tweet.favorite_count > 500000)
          plusFollowes = 0.75
        elsif(tweet.favorite_count > 100000)
          plusFollowes = 0.5
        elsif(tweet.favorite_count > 10000)
          plusFollowes = 0.25
        elsif(tweet.favorite_count > 1000)
          plusFollowes = 0.10
        end

        if infoCiudad == nil
          if label == "pos"
            @valoration = Valoration.new({ ciudad_v: tweet.source, valorPositivo: 1+plusFollowes , valorNegativo: 0, total: 1, valor: 100, numPos: 1, numNeg: 0, numNeutral: 0 })
          elsif label == "neg"
            @valoration = Valoration.new({ ciudad_v: tweet.source, valorPositivo: 0, valorNegativo: 1+plusFollowes , total: 1, valor: 0, numPos: 0, numNeg: 1, numNeutral: 0 })
          else
            @valoration = Valoration.new({ ciudad_v: tweet.source, valorPositivo: 0, valorNegativo: 0 , total: 1, valor: 50, numPos: 0, numNeg: 0, numNeutral: 1 })
          end

          @valoration.save
          
        else
          if (label == "pos")
            porcentajeAux = (infoCiudad.valorPositivo+1+plusFollowes)*100/(infoCiudad.total+1)
            if porcentajeAux > 100
              porcentajeAux = 100
            end
            @valoration = Valoration.new({ ciudad_v: infoCiudad.ciudad_v, valorPositivo: infoCiudad.valorPositivo+1+plusFollowes , valorNegativo: infoCiudad.valorNegativo, total: infoCiudad.total+1, valor: porcentajeAux, numPos: infoCiudad.numPos+1, numNeg: infoCiudad.numNeg, numNeutral: infoCiudad.numNeutral })
             #binding.pry
            @valoration.save
            infoCiudad.destroy
          elsif label == "neg"
            porcentajeAux = infoCiudad.valorPositivo*100/(infoCiudad.total+1)
            if porcentajeAux > 100
              porcentajeAux = 100
            end
            @valoration = Valoration.new({ ciudad_v: infoCiudad.ciudad_v, valorPositivo: infoCiudad.valorPositivo, valorNegativo: infoCiudad.valorNegativo+1+plusFollowes , total: infoCiudad.total+1, valor: porcentajeAux, numPos: infoCiudad.numPos, numNeg: infoCiudad.numNeg+1, numNeutral: infoCiudad.numNeutral })
            @valoration.save
            infoCiudad.destroy
          else
            porcentajeAux = infoCiudad.valorPositivo*100/(infoCiudad.total+1)
            if porcentajeAux > 100
              porcentajeAux = 100
            end
            @valoration = Valoration.new({ ciudad_v: infoCiudad.ciudad_v, valorPositivo: infoCiudad.valorPositivo, valorNegativo: infoCiudad.valorNegativo , total: infoCiudad.total+1, valor: porcentajeAux, numPos: infoCiudad.numPos, numNeg: infoCiudad.numNeg, numNeutral: infoCiudad.numNeutral+1 })
            @valoration.save
            infoCiudad.destroy
          end
        end

        tweet.destroy
      end
    end
  end

  # GET /tweets/1/edit
  def edit
    @valoration = Valoration.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @valoration = Valoration.new(valoration_params)

    respond_to do |format|
      if @valoration.save
        format.html { redirect_to @valoration, notice: 'Valoration was successfully created.' }
        format.json { render :show, status: :created, location: @valoration }
      else
        format.html { render :new }
        format.json { render json: @valoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @valoration.update(valoration_params)
        binding.pry
        format.html { redirect_to @valoration, notice: 'Valoration was successfully updated.' }
        format.json { render :show, status: :ok, location: @valoration }
      else
        format.html { render :edit }
        format.json { render json: @valoration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @valoration.destroy
    respond_to do |format|
      format.html { redirect_to valorations_url, notice: 'Valoration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valoration
      @valoration = Valoration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valoration_params
      params.require(:valoration).permit(:ciudad_v, :valorPositivo, :valorNegativo, :total, :valor)
    end
end
