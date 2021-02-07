import React from "react"
import PropTypes from "prop-types"

class ShowCount extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };
  };

  increment(){
    this.setState(
      {
       count: this.state.count + 1
      }
    )
  };

  decrement(){
    this.setState(
      {
        count: this.state.count - 1
      }
    )
  };

  reset(){
    this.setState(
      {
        count: 0
      }
    )
  };

  render() {
    return (
      // <div style={{
      //    position: 'absolute', left: '50%', top: '50%',
      //    transform: 'translate(-50%, -50%)' }}>
      <div>
        <p>Current Count: { this.state.count }</p>
        <button className="inc" onClick={ (e) => this.increment(e) }>Increment!</button>
        <button className="dec" onClick={ (e) => this.decrement(e) }>Decrement!</button>
        <button className="reset" onClick={ (e) => this.reset(e) }>Reset!</button>
      </div>
    );
  }
}

export default ShowCount;
