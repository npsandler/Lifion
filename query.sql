SELECT
  *
FROM
  vehicles
WHERE
  vehicles.id NOT IN
   (SELECT
      vehicles.id
    FROM
      vehicles
    JOIN reservations
    ON vehicles.id = reservations.vehicle_id
    WHERE
      reservations.startDate > ? AND reservations.endDate < ?
      )
