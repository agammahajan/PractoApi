class DoctorController < ApplicationController
	protect_from_forgery with: :null_session

	

	#create
	def create
		@doctor = Doctor.new(params.permit(:first_name,:second_name,:gender,:city,
			:area,:speciality,:consultaion_charges,:degree,:experience,:clinic_name))
      	if @doctor.save
        	render json: @doctor
      	else
        	render nothing: true, status: :bad_request
     	end
	end

	#read_all
	def list
	  	doctors = Doctor.all
	  	render json: doctors
  	end

  	#delete
  	def delete
      begin
      	doctor = Doctor.find(params[:id])
      	if doctor.destroy
		  	render json: {success: "Success"}, status: 200
		else
		    render json: { errors: "Some Errors" }, status: 422
		end
      rescue Exception => e
      	   render json: { errors: "Some Errors" }, status: 422
      end
	end

	#update
  	def modify
	  doctor = Doctor.find(params[:id])

	  if doctor.update(params.permit(:first_name,:second_name,:gender,:city,
			:area,:speciality,:consultaion_charges,:degree,:experience,:clinic_name))
	    render json: doctor, status: 200
	  else
	    render json: { errors: doctor.errors }, status: 422
	  end
	end

	
    
	 #find doctor by name
	  def searchByName
		url = request.original_url
		
		begin

			prms = CGI.parse(URI.parse(url).query)

			results = Doctor.where("first_name LIKE ?", "%#{prms['name'][0]}%")

			render json: results
		rescue Exception => e
			render json: { errors: "Some errors" }, status: 422
		end
	end

	#find doctor by gender
	  def searchByGender
		url = request.original_url
		
		begin

			prms = CGI.parse(URI.parse(url).query)


			results = Doctor.where("gender LIKE ?", "%#{prms['gender'][0]}%")

			render json: results
		rescue Exception => e
			render json: { errors: "Some errors" }, status: 422
		end
	end

	#find doctor by city
	  def searchByCity
		url = request.original_url
		
		begin

			prms = CGI.parse(URI.parse(url).query)


			results = Doctor.where("city LIKE ?", "%#{prms['city'][0]}%")

			render json: results
		rescue Exception => e
			render json: { errors: "Some errors" }, status: 422
		end
	end

	#find doctor by area
	  def searchByArea
		url = request.original_url
		
		begin

			prms = CGI.parse(URI.parse(url).query)


			results = Doctor.where("area LIKE ?", "%#{prms['area'][0]}%")
			render json: results
		rescue Exception => e
			render json: { errors: "Some errors" }, status: 422
		end
	end

	#find doctor by speciality
	  def searchBySpeciality
		url = request.original_url
		
		begin

			prms = CGI.parse(URI.parse(url).query)


			results = Doctor.where("speciality LIKE ?", "%#{prms['speciality'][0]}%")
			render json: results
		rescue Exception => e
			render json: { errors: "Some errors" }, status: 422
		end
	end

	#find doctor by experience
	  def searchByExperience
		url = request.original_url
		
		begin

			prms = CGI.parse(URI.parse(url).query)


			results = Doctor.where("experience LIKE ?", "%#{prms['experience'][0]}%")
			render json: results
		rescue Exception => e
			render json: { errors: "Some errors" }, status: 422
		end
	end

	#find doctor by clinic_name
	  def searchByClinic
		url = request.original_url
		
		begin

			prms = CGI.parse(URI.parse(url).query)


			results = Doctor.where("clinic_name LIKE ?", "%#{prms['clinic'][0]}%")
			render json: results
		rescue Exception => e
			render json: { errors: "Some errors" }, status: 422
		end
	end
end

