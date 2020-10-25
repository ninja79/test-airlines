import React from 'react'

const ReviewForm = (props) => {
  return (
    <div className="wrapper">
      <form onSubmit={props.handleSubmit}> 
        <div>Had an experience with {props.attributes.name}? Share your review</div>
        <div className="field">
          <input onChange={props.handleChange} value={props.review.title} 
                type="text" name="title" placeholder="Review title"/>
        </div>
        <div className="field">
          <input onChange={props.handleChange} value={props.review.description} 
                type="text" name="description" placeholder="Review Description"/>
        </div>    
        <div className="field">
          <div className="rating-container">
            <div className="rating-title-text">Rate this Airline</div>
            [Star Rating goes here!]          
          </div>
        </div>            
        <button type="submit">Submit your review</button>
      </form>
    </div>
  )
}

export default ReviewForm