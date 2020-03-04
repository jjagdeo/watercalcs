# Function describing water stored in a watershed/year using simplified inflow/outflow processes
# Function assumptions: The user must provide watershed_size in square miles and precipitation, evaporation, and runoff in inches per year

waterstorage = function(precip, evap, runoff, watershed_size) {
  storage = ((precip - (evap + runoff)) * 0.0833333) * (watershed_size * 27880000) 
  # Multiply by watershed size to get volumetric storage from rate inputs: precip, evap, runoff
  # Multiple watershed_size (given by user in square miles) by 27,880,000 to convert to square feet
  # Multiply precip - (evap + runoff) (given by user in inches) by 0.0833333 to convert to feet
  precip = ifelse((precip < 0), return("Precipitation must be greater than or equal to zero"), precip)
  evap = ifelse((evap < 0), return("Evaporation cannot be negative"), evap)
  runoff = ifelse((runoff < 0), return("Runoff cannot be negative"), runoff)
  return(storage)
  # Storage is returned in units of cubic feet per year
}
