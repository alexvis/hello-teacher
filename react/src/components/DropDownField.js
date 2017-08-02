import React from 'react';

const DropDownField = (props) => {
  return (
    <label>
      {props.label}
      <select value={props.rating} onChange={props.handleSelect}>
        <option value="-">-</option>
        <option value='AK'>Alaska</option>
        <option value='AL'>Alabama</option>
        <option value='AR'>Arkansas</option>
        <option value='AS'>American Samoa</option>
        <option value='AZ'>Arizona</option>
      </select>
    </label>
  );
}

export default DropDownField;

    //
    //
    // ["Arizona", "AZ"],
    // ["California", "CA"],
    // ["Colorado", "CO"],
    // ["Connecticut", "CT"],
    // ["District of Columbia", "DC"],
    // ["Delaware", "DE"],
    // ["Florida", "FL"],
    // ["Georgia", "GA"],
    // ["Guam", "GU"],
    // ["Hawaii", "HI"],
    // ["Iowa", "IA"],
    // ["Idaho", "ID"],
    // ["Illinois", "IL"],
    // ["Indiana", "IN"],
    // ["Kansas", "KS"],
    // ["Kentucky", "KY"],
    // ["Louisiana", "LA"],
    // ["Massachusetts", "MA"],
    // ["Maryland", "MD"],
    // ["Maine", "ME"],
    // ["Michigan", "MI"],
    // ["Minnesota", "MN"],
    // ["Missouri", "MO"],
    // ["Mississippi", "MS"],
    // ["Montana", "MT"],
    // ["North Carolina", "NC"],
    // ["North Dakota", "ND"],
    // ["Nebraska", "NE"],
    // ["New Hampshire", "NH"],
    // ["New Jersey", "NJ"],
    // ["New Mexico", "NM"],
    // ["Nevada", "NV"],
    // ["New York", "NY"],
    // ["Ohio", "OH"],
    // ["Oklahoma", "OK"],
    // ["Oregon", "OR"],
    // ["Pennsylvania", "PA"],
    // ["Puerto Rico", "PR"],
    // ["Rhode Island", "RI"],
    // ["South Carolina", "SC"],
    // ["South Dakota", "SD"],
    // ["Tennessee", "TN"],
    // ["Texas", "TX"],
    // ["Utah", "UT"],
    // ["Virginia", "VA"],
    // ["Virgin Islands", "VI"],
    // ["Vermont", "VT"],
    // ["Washington", "WA"],
    // ["Wisconsin", "WI"],
    // ["West Virginia", "WV"],
    // ["Wyoming", "WY"]
