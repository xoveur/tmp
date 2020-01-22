import styled from 'styled-components';
import { Link } from '@reach/router';

export const Wrapper = styled.div`
  background: #fff;
  border-radius: 8px;
  display: flex;
  padding: 24px 16px;
  margin: 0 -16px;
  transition: 0.4s;

  &:hover {
    background: #f1f1f1;
  }
`;

export const Content = styled.div`
  flex: 1;
  margin-left: 16px;
`;

export const DisplayName = styled.span`
  color: #000;
  font-weight: bold;
`;

export const Info = styled.div`
  color: #bbb;
`;

export const StyledLink = styled(Link)`
  color: inherit;
`;

export const Message = styled.div`
  font-size: 20px;
  margin: 16px 0;
`;

export const Actions = styled.div`
  display: flex;
  justify-content: space-between;
  max-width: 320px;
`;

export const Button = styled.button`
  background: none;
  border: none;
  color: #bbb;
  margin: 0;
  outline: none;
  padding: 0;
  &:disabled {
    color: #ddd;
  }
`;

export const Spacer = styled.div`
  width: 24px;
`;
