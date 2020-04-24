import React from 'react';
import styled from 'styled-components';
import Title from './Title';
import Image from './Image';
import Price from './Price';
import Badge from './Badge';

const ProductLi = styled.li`
  width: var(--slider-width);
  border: 1px solid yellow;
`;

const ProductInfoDl = styled.dl`
  padding: 1rem 0.625rem 0.75rem 0.625rem;
`;

const Product = ({ list: { alt, badge, delivery_type, description, image, n_price, s_price, title } }) => {
  return (
    <ProductLi>
      <Image alt={alt} src={image} deliveryType={delivery_type} />
      <ProductInfoDl>
        <Title title={title} desc={description} />
        <Price originPrice={n_price} salePrice={s_price} />
      </ProductInfoDl>
      <Badge list={badge} />
    </ProductLi>
  );
};

export default Product;
