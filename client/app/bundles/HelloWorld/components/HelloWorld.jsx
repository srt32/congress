import React, { PropTypes } from 'react';

const HelloWorld = ({ name, bills }) => (
  <div>
    <ul>
      {bills.map(function(bill) {
        return <li key={bill.raw_bill.bill_id}>{bill.raw_bill.bill_id}</li>
      })}
    </ul>
    <hr />
  </div>
);

HelloWorld.propTypes = {
  bills: PropTypes.array.isRequired,
  name: PropTypes.string.isRequired,
};

export default HelloWorld;
