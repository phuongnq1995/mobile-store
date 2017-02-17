package org.mobile.converter;

import java.beans.PropertyEditorSupport;

import org.mobile.price.model.Price;

public class PriceEditor extends PropertyEditorSupport {
	public void setAsText(String id) {
		Price price = null;

		price = new Price(Integer.parseInt(id),new Long(500), true);

		this.setValue(price);
	}
}
