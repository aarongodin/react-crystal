/**
export default (props) => {
  const { content } = props
  
  return (
    <div>
      <h1>Test Component</h1>
      <span>{content}</span>
    </div>
  )
}
 */

var React = require('react');

module.exports = function (props) {
  var content = props.content;

  return React.createElement(
    "div",
    null,
    React.createElement(
      "h1",
      null,
      "Test Component"
    ),
    React.createElement(
      "span",
      null,
      content
    )
  );
};
