import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

import { Editor as ToastEditor } from '@toast-ui/react-editor';
import 'codemirror/lib/codemirror.css';
import '@toast-ui/editor/dist/toastui-editor.css';

const Wrapper = styled.div`
  
`;

const configuration = {
  toolbar: [
    'heading',
    '|',
    'bold',
    'italic',
    'link',
    'bulletedList',
    'numberedList',
    '|',
    'indent',
    'outdent',
    '|',
    'blockQuote',
    'insertTable',
    'mediaEmbed',
    'undo',
    'redo',
  ],
};

class Editor extends React.Component {

  constructor(props) {
    super(props);
    this.editorRef = React.createRef();
    this.state = {
    };
  }

  handleClickButton = () => {
    this.editorRef.current.getRootElement().classList.add('my-editor-root');
  };

  replaceValue = (value) => {
    console.log("replacevalue", value, this);
    this.editorRef.current.editorInst.setMarkdown(value);
  }

  render() {
    // https://www.npmjs.com/package/@toast-ui/react-editor
    const editor = this.editorRef;
    const that = this;
    return (
      <Wrapper>
        <ToastEditor
          name={this.props.name}
          previewStyle="vertical"
          height={this.props.height}
          initialEditType="markdown"
          initialValue={this.props.value}
          ref={editor}
          onChange={(event) => {
            // console.log("event onchange", event, editor.current);
            const val = editor.current.editorInst.getMarkdown();
            // console.log("toastuievent", event, val);
            // const data = editor.getData();
            that.props.onChange({ target: { name: that.props.name, value: val } });
          }}

        />
      </Wrapper>
    );
    // ref={this.editorRef}
    // onFocus={this.handleFocus}
  }
}

Editor.propTypes = {
  onChange: PropTypes.func.isRequired,
  name: PropTypes.string.isRequired,
  value: PropTypes.string,
  height: PropTypes.string
};

Editor.defaultProps = {
  height: "400px"
};

export default Editor;
