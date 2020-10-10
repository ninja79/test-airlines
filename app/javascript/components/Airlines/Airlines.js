import React, { useState, useEffect} from 'react'
import axios from 'axios'

const Airlines = () => {
  const [airlines, setAirlines] = useState([])
  
  useEffect(() => {
    // Get all airlines
    // Update airlines in our state  

    axios.get('/api/v1/airlines.json')
      .then ( resp => console.log(resp) )
      .catch( resp => console.log(resp) )    
  }, [airlines.length])
  
  return (
    <div>This is the Airlines#index view for app.</div>
  )
}

export default Airlines