// ==UserScript==
// @name        Notion.so tab fix
// @namespace   Violentmonkey Scripts
// @match       https://www.notion.so/*
// @grant       none
// @version     1.0
// @author      -
// @description 6/26/2020, 11:47:03 AM
// ==/UserScript==

const css = `
  .notion-code-block { -moz-tab-size: 2; }
`;

const style = document.createElement('style');
style.appendChild(document.createTextNode(css));
style.type = 'text/css';
document.head.appendChild(style);
