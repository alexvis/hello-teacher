import React from 'react';
import { Link } from 'react-router'


const NabBar = (props) => {

  return(

    <div>
      <h1> hello from NAbBar</h1>
      {props.children}
    </div>
  )
}

export default NabBar;
