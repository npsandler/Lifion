
# I was unclear by the wording of the problem whether be finding the most frequent specific
# vehicle rentals or most frequent models/categories, so I wrote both!


# Assuming we have access to vehicles/rentals and associations set up using an ORM.

def top_five_vehicles
  rentals = Rental.all
  reservations = Hash.new(0)
  rentals.each do |rental|
    reservations[rental.vehicle_id] += 1
  end

  top_vehicles = reservations.sort { | _, v| v }.reverse
  top_vehicles.keys.take(5)
end


def top_five_cagetories_and_models
  rentals = Rental.all
  category_counter = Hash.new(0)
  model_counter = Hash.new(0)

  rentals.each do |rental|
    category_counter[rental.category] += 1
    model_counter[rental.model] += 1
  end

  category_counter.sort_by { | _ , v| v}
  model_counter.sort_by { | _ , v| v}

  top_categories = category_counter.keys.reverse.take(5)
  top_models = model_counter.keys.reverse.take(5)

  result = { "Most frequent categories" +. top_categories, "Most frequent models" => top_models}

  return result
end
