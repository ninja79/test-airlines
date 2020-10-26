import React, {Fragment} from 'react'
//import styled from 'styled-components'

const Review = (props) => {
  const {score, title, description} = props.attributes
  
  return (
    <div className="card">
      <div className="rating-container">
        <div className="rating-score">{score}</div> 
      </div> 
      <div className="title">{title}</div>   
      <div className="description">{description}</div> 
    </div>
  )
}

export default Review
