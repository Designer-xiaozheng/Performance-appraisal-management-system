<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','voting_title') || $check_field('add','voting_title') || $check_field('set','voting_title')" :xs="24" :sm="12" :lg="8">
				<el-form-item label=" 投票标题" prop="voting_title">
					<el-input id="voting_title" v-model="form['voting_title']" placeholder="请输入 投票标题"
							  v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','voting_title')) || (!form['voting_center_id'] && $check_field('add','voting_title'))" :disabled="disabledObj['voting_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','voting_title')">{{form['voting_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','voting_cover') || $check_field('add','voting_cover') || $check_field('set','voting_cover')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="投票封面" prop="voting_cover">
					<el-upload :disabled="disabledObj['voting_cover_isDisabled']" id="voting_cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_voting_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','voting_cover')) || (!form['voting_center_id'] && $check_field('add','voting_cover'))">
						<img v-if="form['voting_cover']" :src="$fullUrl(form['voting_cover'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','voting_cover')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['voting_cover'])" :preview-src-list="[$fullUrl(form['voting_cover'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','start_time') || $check_field('add','start_time') || $check_field('set','start_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="开始时间" prop="start_time">
					<el-date-picker :disabled="disabledObj['start_time_isDisabled']" v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','start_time')) || (!form['voting_center_id'] && $check_field('add','start_time'))" id="start_time"
						v-model="form['start_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','start_time')">{{form['start_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','deadline') || $check_field('add','deadline') || $check_field('set','deadline')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="截止时间" prop="deadline">
					<el-date-picker :disabled="disabledObj['deadline_isDisabled']" v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','deadline')) || (!form['voting_center_id'] && $check_field('add','deadline'))" id="deadline"
						v-model="form['deadline']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','deadline')">{{form['deadline']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','voting_content') || $check_field('add','voting_content') || $check_field('set','voting_content')" :xs="24" :sm="24" :lg="24">
				<el-form-item label="投票内容" prop="voting_content">
					<quill-editor v-model.number="form['voting_content']"
						v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','voting_content')) || (!form['voting_center_id'] && $check_field('add','voting_content')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','voting_content')" v-html="form['voting_content']"></div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item label="计时器标题" prop="timer_title">
					<el-input id="timer_title" v-model="form['timer_title']" placeholder="请输入计时器标题"
							  v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','timer_title')) || (!form['voting_center_id'] && $check_field('add','timer_title'))" :disabled="disabledObj['timer_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','timer_title')">{{form['timer_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item label="计时开始时间" prop="timing_start_time">
					<el-date-picker id="timing_start_time" v-model="form['timing_start_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','timing_start_time')) || (!form['voting_center_id'] && $check_field('add','timing_start_time'))" :disabled="disabledObj['timing_start_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_start_time')">{{form['timing_start_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item label="计时结束时间" prop="timing_end_time">
					<el-date-picker id="timing_end_time" v-model="form['timing_end_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || (form['voting_center_id'] && $check_field('set','timing_end_time')) || (!form['voting_center_id'] && $check_field('add','timing_end_time'))" :disabled="disabledObj['timing_end_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_end_time')">{{form['timing_end_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "voting_center_id",
				url_add: "~/api/voting_center/add?",
				url_set: "~/api/voting_center/set?",
				url_get_obj: "~/api/voting_center/get_obj?",
				url_upload: "~/api/voting_center/upload?",

				query: {
					"voting_center_id": 0,
				},

				form: {
					"voting_title":'', //  投票标题
					"voting_cover":'', // 投票封面
					"start_time":'', // 开始时间
					"deadline":'', // 截止时间
					"voting_content":'', // 投票内容
					"voting_center_id": 0, // ID
					"timer_title":'', // 计时器标题
					"timing_start_time":'', // 计时开始时间
					"timing_end_time":'', // 计时结束时间

				},
				disabledObj:{
					"voting_title_isDisabled": false,
					"voting_cover_isDisabled": false,
					"start_time_isDisabled": false,
					"deadline_isDisabled": false,
					"voting_content_isDisabled": false,
					"timer_title_isDisabled": false,
					"timing_start_time_isDisabled": false,
					"timing_end_time_isDisabled": false,
				},

			}
		},
		methods: {
			/**
			 * 上传投票封面
			 * @param {Object} param图片参数
			 */
			upload_voting_cover(param){
				this.uploadFile(param.file, "voting_cover");
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							if(dbKey === "charging_standard"){
								this.form['charging_rules'] = form[dbKey];
								this.disabledObj['charging_rules_isDisabled'] = true;
							};
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				this.form["start_time"] = this.$toTime(parseInt(this.form["start_time"]),"yyyy-MM-dd")
				this.form["deadline"] = this.$toTime(parseInt(this.form["deadline"]),"yyyy-MM-dd")
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
				if(parseInt(this.form["start_time"]) > 9999){
					this.form["start_time"] = this.$toTime(parseInt(this.form["start_time"]),"yyyy-MM-dd")
				}
				if(parseInt(this.form["deadline"]) > 9999){
					this.form["deadline"] = this.$toTime(parseInt(this.form["deadline"]),"yyyy-MM-dd")
				}
				this.form["timing_start_time"] = this.$toTime(parseInt(this.form["timing_start_time"]),"yyyy-MM-dd hh:mm:ss")
				this.form["timing_end_time"] = this.$toTime(parseInt(this.form["timing_end_time"]),"yyyy-MM-dd hh:mm:ss")

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/voting_center/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_center/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_center/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_center/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/voting_center/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
		}
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
