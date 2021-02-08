import React from "react"
import PropTypes from "prop-types"

class Article extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className='article-title'>
          <a href={this.props.path}>{this.props.title}</a>
        </div>
        <div className='article-content'>
          {this.props.content}
        </div>
      </React.Fragment>
    );
  }
}

Article.propTypes = {
  title: PropTypes.string,
  path: PropTypes.string,
  content: PropTypes.string,
};
export default Article
