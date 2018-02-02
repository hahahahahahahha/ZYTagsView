Pod::Spec.new do |s|
s.name         = 'ZYTagsView'
s.version      = '1.0.0'
s.summary      = '可折行计算宽度的标签View'
s.homepage     = 'https://github.com/hahahahahahahha/ZYTagsView.git'
s.license      = 'MIT'
s.authors      = {'ZYL' => 'zylkdds@sina.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/hahahahahahahha/ZYTagsView.git', :tag => s.version}
s.source_files = 'TagsDemo/*.{h,m}'
s.requires_arc = true
end
