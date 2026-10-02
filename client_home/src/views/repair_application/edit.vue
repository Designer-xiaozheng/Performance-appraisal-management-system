<template>
	<div class="diy_edit page_repair_application" id="repair_application_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row'>
					<div v-if="$check_field('set','repair_title') || $check_field('add','repair_title') || $check_field('get','repair_title')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>报修标题:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_repair_title" v-model="form['repair_title']" placeholder="请输入报修标题" v-if="(form['repair_title'] && $check_field('set','repair_title')) || (!form['repair_title'] && $check_field('add','repair_title'))"  :disabled="disabledObj['repair_title_isDisabled']"/>
							<span v-else-if="$check_field('get','repair_title')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','repair_type') || $check_field('add','repair_type') || $check_field('get','repair_type')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>报修类型:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_repair_type" v-model="form['repair_type']" placeholder="请输入报修类型" v-if="(form['repair_type'] && $check_field('set','repair_type')) || (!form['repair_type'] && $check_field('add','repair_type'))"  :disabled="disabledObj['repair_type_isDisabled']"/>
							<span v-else-if="$check_field('get','repair_type')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','related_pictures') || $check_field('add','related_pictures') || $check_field('get','related_pictures')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>相关图片:
							</span>
						</div>
						<!-- 图片 -->
						<input type="file" :disabled="disabledObj['related_pictures_isDisabled']" style="display: none;" id="form_img_related_pictures" title="related_pictures" @change="change_file($event.target.files,'related_pictures')"/>
						<!-- 修改权限 -->
						<div class="diy_field diy_img" v-if="form['related_pictures'] && $check_field('set','related_pictures')">
							<label for="form_img_related_pictures">
								<img :src="$fullUrl(form['related_pictures'])" />
							</label>
						</div>
						<!-- 添加权限 -->
						<div class="diy_field diy_img" v-else-if="!form['related_pictures'] && $check_field('add','related_pictures')">
							<label for="form_img_related_pictures">
								<div class="btn_add_img">
									<span>+</span>
								</div>
							</label>
						</div>
						<!-- 查询权限 -->
						<div class="diy_field diy_img" v-else-if="$check_field('get','related_pictures')">
							<img :src="$fullUrl(form['related_pictures'])" />
						</div>
					</div>
					<div v-if="$check_field('set','application_time') || $check_field('add','application_time') || $check_field('get','application_time')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>申请时间:
							</span>
						</div>
						<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['application_time_isDisabled']" id="form_application_time" v-model="form['application_time']" placeholder="请输入申请时间" v-if="(form['application_time'] && $check_field('set','application_time')) || (!form['application_time'] && $check_field('add','application_time'))" />
							<span v-else-if="$check_field('get','application_time')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','owner_account_number') || $check_field('add','owner_account_number') || $check_field('get','owner_account_number')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>业主账号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_owner_account_number" :disabled="disabledObj['owner_account_number_isDisabled']" v-model="form['owner_account_number']" v-if="(form['owner_account_number'] && $check_field('set','owner_account_number')) || (!form['owner_account_number'] && $check_field('add','owner_account_number'))" >
								<option v-for="o in list_user_owner_account_number" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','owner_account_number')">{{ form['owner_account_number'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','full_name') || $check_field('add','full_name') || $check_field('get','full_name')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>姓名:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_full_name" v-model="form['full_name']" placeholder="请输入姓名" v-if="(form['full_name'] && $check_field('set','full_name')) || (!form['full_name'] && $check_field('add','full_name'))"  :disabled="disabledObj['full_name_isDisabled']"/>
							<span v-else-if="$check_field('get','full_name')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','building_no') || $check_field('add','building_no') || $check_field('get','building_no')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>楼栋号:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_building_no" v-model="form['building_no']" placeholder="请输入楼栋号" v-if="(form['building_no'] && $check_field('set','building_no')) || (!form['building_no'] && $check_field('add','building_no'))"  :disabled="disabledObj['building_no_isDisabled']"/>
							<span v-else-if="$check_field('get','building_no')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','house_number') || $check_field('add','house_number') || $check_field('get','house_number')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>门牌号:
							</span>
						</div>
						<!-- 文本 -->
						<div class="diy_field diy_text">
							<input type="text" id="form_house_number" v-model="form['house_number']" placeholder="请输入门牌号" v-if="(form['house_number'] && $check_field('set','house_number')) || (!form['house_number'] && $check_field('add','house_number'))"  :disabled="disabledObj['house_number_isDisabled']"/>
							<span v-else-if="$check_field('get','house_number')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','related_content') || $check_field('add','related_content') || $check_field('get','related_content')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>相关内容:
							</span>
						</div>
						<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_related_content" v-model="form['related_content']" v-if="(form['related_content'] && $check_field('set','related_content')) || (!form['related_content'] && $check_field('add','related_content'))" :disabled="disabledObj['related_content_isDisabled']" />
							<span v-else-if="$check_field('get','related_content')">{{ form['full_name'] }}</span>
						</div>
					</div>
					<div v-if="$check_field('set','reply_content') || $check_field('add','reply_content') || $check_field('get','reply_content')" class="col-12 col-md-6">
						<div class="diy_title">
							<span>回复内容:
							</span>
						</div>
						<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_reply_content" v-model="form['reply_content']" v-if="(form['reply_content'] && $check_field('set','reply_content')) || (!form['reply_content'] && $check_field('add','reply_content'))" :disabled="disabledObj['reply_content_isDisabled']" />
							<span v-else-if="$check_field('get','reply_content')">{{ form['full_name'] }}</span>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/repair_application/get_obj?",
				url_add: "~/api/repair_application/add?",
				url_set: "~/api/repair_application/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
					"repair_title": "",
					"repair_type": "",
					"related_pictures": "",
					"application_time": "",
					"owner_account_number": 0,
					"full_name": "",
					"building_no": "",
					"house_number": "",
					"related_content": "",
					"reply_content": "",
					"repair_application_id": 0,
				},

				obj: {
					"repair_title":'', // 报修标题
					"repair_type":'', // 报修类型
					"related_pictures":'', // 相关图片
					"application_time": "1970-01-01 00:00:00",
					"owner_account_number": 0, // 业主账号
					"full_name":'', // 姓名
					"building_no":'', // 楼栋号
					"house_number":'', // 门牌号
					"related_content":'', // 相关内容
					"reply_content":'', // 回复内容
					"repair_application_id": 0,
				},

				// 表单字段
				form: {
					"repair_title":'', // 报修标题
					"repair_type":'', // 报修类型
					"related_pictures":'', // 相关图片
					"application_time": "1970-01-01 00:00:00",
					"owner_account_number": 0, // 业主账号
					"full_name":'', // 姓名
					"building_no":'', // 楼栋号
					"house_number":'', // 门牌号
					"related_content":'', // 相关内容
					"reply_content":'', // 回复内容
					"repair_application_id": 0,

				},
				disabledObj:{
					"repair_title_isDisabled": false,
					"repair_type_isDisabled": false,
					"related_pictures_isDisabled": false,
					"application_time_isDisabled": false,
					"owner_account_number_isDisabled": false,
					"full_name_isDisabled": false,
					"building_no_isDisabled": false,
					"house_number_isDisabled": false,
					"related_content_isDisabled": false,
					"reply_content_isDisabled": false,
				},
				// 用户列表
				list_user_owner_account_number: [],

				// ID字段
				field: "repair_application_id",
			}
		},
		methods: {
			/**
			 * 获取业主用户列表
			 */
			async get_list_user_owner_account_number() {
				// if(this.user_group !== "管理员" && this.form["owner_account_number"] === 0) {
				//     this.form["owner_account_number"] = this.user.user_id;
				// }
				var json = await this.$get("~/api/user/get_list?user_group=业主");
				if(json.result && json.result.list){
					this.list_user_owner_account_number = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			async get_user_session_owner_account_number(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=业主");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["owner_account_number"] = user_id
								_this.disabledObj['owner_account_number' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
									for (var j=0;j<arrForm.length;j++){
										if (arr[i]===arrForm[j]){
											if (arr[i]!=="owner_account_number") {
												_this.form[arrForm[j]] = res.result.obj[arr[i]]
												_this.disabledObj[arrForm[j] + '_isDisabled'] = true
												break;
											}
										}
									}
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},

			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/repair_application/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				if (form) {
					this.obj = $.push(this.obj ,form);
					this.form = $.push(this.form ,form);
				}
				var arr = []
				for (let key in form) {
					arr.push(key)
				}
				for (var i=0;i<arr.length;i++){
					this.disabledObj[arr[i] + '_isDisabled'] = true
				}
				this.form["application_time"] = this.$toTime(parseInt(this.form["application_time"]),"yyyy-MM-dd")
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				var form = $.db.get("form");
				var obj = Object.assign({} ,form ,this.obj);
				if (form) {
					this.obj = $.push(this.obj ,obj);
				}
				if (form) {
					this.form = $.push(this.form ,form);
				}
				if(func){
					func(json);
				}
			},

		},
		created() {
			this.get_user_session_owner_account_number();
			this.get_list_user_owner_account_number();
		}
	}
</script>

<style>
</style>
