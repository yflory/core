#include "precompiled_cpodf.h"
#include "logging.h"

#include "odf_style_state.h"
#include "odf_conversion_context.h"

#include "styles.h"

namespace cpdoccore {
namespace odf {

odf_style_state::odf_style_state(odf_conversion_context & Context, office_element_ptr & elm, const style_family family ): context_(Context)   
{        
	odf_style_ = elm;
	automatic_= false;

	style* style_ = dynamic_cast<style*>(elm.get());
	if (!style_)return;

	style_->style_family_ = family;

//set default

}

office_element_ptr & odf_style_state::get_office_element()
{
	return odf_style_;
}

void odf_style_state::set_name(std::wstring name)
{
	style* style_ = dynamic_cast<style*>(odf_style_.get());
	if (!style_)return;
	
	style_->style_name_ = name;
}
std::wstring & odf_style_state::get_name()
{
	style* style_ = dynamic_cast<style*>(odf_style_.get());
	if (!style_)return std::wstring();

	return style_->style_name_;
}
void odf_style_state::set_automatic(bool val)
{
	automatic_ = val;
}

void odf_style_state::convert()
{
	if (odf_style_== NULL)return;


}

}
}
