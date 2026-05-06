BOARDING PASS
═══════════════════════════════════════════════
Passenger  : ${passengerName}
Flight     : ${flightNumber}  ${origin} → ${destination}
Gate       : ${gate}
Seat       : ${seat}   Class: ${cabinClass}
───────────────────────────────────────────────
Boarding   : ${boardingTime?datetime("yyyy-MM-dd HH:mm")?string("EEE, MMM d · HH:mm")}
Departure  : ${departureTime?datetime("yyyy-MM-dd HH:mm")?string("EEE, MMM d · HH:mm")}
Arrival    : ${arrivalTime?datetime("yyyy-MM-dd HH:mm")?string("EEE, MMM d · HH:mm")}
═══════════════════════════════════════════════