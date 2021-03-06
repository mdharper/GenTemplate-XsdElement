/*******************************************************************************
 * Copyright © 2013, 2016 Modelsolv, Inc.
 * All Rights Reserved.
 *
 * NOTICE: All information contained herein is, and remains the property
 * of ModelSolv, Inc. See the file license.html in the root directory of
 * this project for further information.
 *******************************************************************************/

package com.modelsolv.reprezen.gentemplates.xsdelement.xtend

import com.google.common.collect.Iterables
import com.modelsolv.reprezen.restapi.PropertyRealization
import com.modelsolv.reprezen.restapi.ServiceDataResource
import com.modelsolv.reprezen.restapi.TypedMessage
import com.modelsolv.reprezen.restapi.datatypes.PrimitiveProperty
import com.modelsolv.reprezen.restapi.datatypes.ReferenceProperty

class PropertyRealizationHelper {
	
	extension FeatureHelper = new FeatureHelper

	def dispatch Iterable<PropertyRealization> getReferencePropRzs(Iterable<PropertyRealization> features) {
		features.filter[it.baseProperty instanceof ReferenceProperty]
	}

	def dispatch Iterable<PropertyRealization> getReferencePropRzs(ServiceDataResource dataResource) {
		dataResource.includedProperties.referencePropRzs
	}

	def dispatch Iterable<PropertyRealization> getReferencePropRzs(TypedMessage message) {
		message.includedProperties.referencePropRzs
	}
	
	def private Iterable<PropertyRealization> getPrimitivePropRzs(Iterable<PropertyRealization> features) {
		features.filter[it.baseProperty instanceof PrimitiveProperty]
	}
	
	def Iterable<PropertyRealization> getPrimitiveMultiPropRzs(Iterable<PropertyRealization> features) {
		features.primitivePropRzs.filter[it.isMultiValued]
	}

	def Iterable<PropertyRealization> getPrimitiveMultiPropRzs(ServiceDataResource dataResource) {
		dataResource.includedProperties.primitiveMultiPropRzs
	}

	def Iterable<PropertyRealization> getPrimitiveMultiPropRzs(TypedMessage message) {
		message.includedProperties.primitiveMultiPropRzs
	}

	def boolean hasSequencePropRzs(ServiceDataResource dataResource) {
		dataResource.includedProperties.hasSequencePropRzs
	}

	def boolean hasSequencePropRzs(TypedMessage message) {
		message.includedProperties.hasSequencePropRzs
	}

	def boolean hasSequencePropRzs(Iterable<PropertyRealization> features) {
		!features.sequencePropRzs.nullOrEmpty
	}

	def private Iterable<PropertyRealization> getSequencePropRzs(Iterable<PropertyRealization> features) {
		Iterables.concat(
			features.referencePropRzs,
			features.primitiveMultiPropRzs)
	}
}