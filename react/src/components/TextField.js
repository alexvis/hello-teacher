import React from 'react';

const TextField = (props) => {
  return (
    <label htmlFor={props.name} onChange={props.handleChange}>{props.label}
      <input
        id={props.name}
        name={props.name}
        type='text'
        value={props.content}
      />
    </label>
  );
}

export default TextField;
