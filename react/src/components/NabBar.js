import React from 'react';
import { Link } from 'react-router'
import SchoolsContainer from '../containers/SchoolsContainer'

const NabBar = (props) => {

  return(

    <div>
    <h1>nab bar</h1>
      {props.children}
    </div>
  )
}

export default NabBar;
